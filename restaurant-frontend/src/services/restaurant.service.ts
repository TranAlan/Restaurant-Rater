import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';
import {Restaurant} from '../models/Restaurant.model';

@Injectable()
export class RestaurantService{
    constructor(private http: HttpClient){}

    public getRestaurants(): Observable<any>{
        return this.http.get('http://localhost:8080/restaurants')

    }
    public getCategories(): Observable<any>{
        return this.http.get('http://localhost:8080/restaurantCategories')

    }

    public deleteRestaurant(restname: string): Observable<any>{
        return this.http.post('http://localhost:8080/restaurant/delete', restname)
    }

    public addRestaurant(restaurant : Restaurant): Observable<any>{
        return this.http.post('http://localhost:8080/restaurant/add', restaurant);
    }

    public queryD(id : string): Observable<any> {
        return this.http.get('http://localhost:8080/expensiveItem?restaurant=' + id);
    }

}